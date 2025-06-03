import { useEffect, useState } from "react"; // Импортируем хуки React
import initSqlJs from "sql.js";              // Импортируем sql.js для работы с SQLite в браузере

export default function App() {
  // Состояние для базы данных SQLite
  const [db, setDb] = useState(null);

  // Состояние для текущего SQL-запроса
  const [query, setQuery] = useState("SELECT * FROM employees;");

  // Состояние для результата выполнения SQL-запроса
  const [result, setResult] = useState(null);

  // Состояние для таблиц с данными (будет массив объектов: таблица + колонки + строки)
  const [tablesWithData, setTablesWithData] = useState([]);

  // Хук, который выполнится один раз после монтирования компонента
  useEffect(() => {
    // Загружаем и инициализируем SQLite через WebAssembly
    initSqlJs({ locateFile: file => `https://sql.js.org/dist/${file}` }).then(SQL => {
      const db = new SQL.Database(); // Создаем новую базу данных в памяти (in-memory)

      // Создаём таблицу сотрудников
      db.run(`
        CREATE TABLE employees (
          id INTEGER PRIMARY KEY,
          name TEXT,
          age INTEGER,
          salary INTEGER,
          department_id INTEGER
        );
      `);

      // Создаём таблицу отделов
      db.run(`
        CREATE TABLE departments (
          id INTEGER PRIMARY KEY,
          name TEXT
        );
      `);

      // Вставляем данные в таблицу departments
      db.run(`
        INSERT INTO departments (id, name) VALUES
          (1, 'HR'),
          (2, 'IT'),
          (3, 'Marketing');
      `);

      // Данные для таблицы сотрудников (включая связи с отделами)
      const employees = [
        [1, "Alice", 25, 50000, 1],
        [2, "Bob", 30, 60000, 2],
        [3, "Charlie", 35, 70000, 2],
        [4, "David", 40, 80000, 3],
        [5, "Eve", 45, 90000, 1],
      ];

      // Готовим выражение для вставки строк в таблицу employees
      const stmt = db.prepare("INSERT INTO employees VALUES (?, ?, ?, ?, ?)");
      for (let row of employees) stmt.run(row); // Вставляем каждую строку
      stmt.free(); // Освобождаем ресурсы после вставки

      setDb(db); // Сохраняем базу данных в состояние

      // Получаем список таблиц, исключая системные (sqlite_internal и т.д.)
      const tableRes = db.exec("SELECT name FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%';");
      const tables = tableRes[0]?.values.map(row => row[0]) || []; // Извлекаем названия таблиц

      // Для каждой таблицы извлекаем все данные
      const dataPerTable = tables.map(table => {
        const res = db.exec(`SELECT * FROM ${table}`);
        return {
          name: table,
          columns: res[0]?.columns || [],
          rows: res[0]?.values || [],
        };
      });

      setTablesWithData(dataPerTable); // Сохраняем данные всех таблиц в состояние
    });
  }, []);

  // Функция выполнения SQL-запроса по кнопке
  const execute = () => {
    try {
      const res = db.exec(query); // Выполняем SQL-запрос
      setResult(res[0] || { columns: [], values: [] }); // Сохраняем первую таблицу результата
    } catch (e) {
      // В случае ошибки сохраняем сообщение об ошибке как результат
      setResult({ columns: ["Error"], values: [[e.message]] });
    }
  };

  return (
    <div style={{ padding: 20 }}>
      <h2>SQLite + React: Таблицы с данными и SQL-запросы</h2>

      {/* Вывод всех таблиц и их содержимого */}
      <div style={{ marginBottom: 30 }}>
        <strong>Все таблицы в базе:</strong>
        {tablesWithData.map(table => (
          <div key={table.name} style={{ marginTop: 20 }}>
            <h4>{table.name}</h4>
            <table border="1" cellPadding="5">
              <thead>
                <tr>
                  {table.columns.map(col => (
                    <th key={col}>{col}</th> // Заголовки колонок
                  ))}
                </tr>
              </thead>
              <tbody>
                {table.rows.map((row, idx) => (
                  <tr key={idx}>
                    {row.map((val, i) => (
                      <td key={i}>{val}</td> // Ячейки данных
                    ))}
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        ))}
      </div>

      {/* Поле для выполнения произвольных SQL-запросов */}
      <textarea
        rows={6}
        style={{ width: "100%", fontFamily: "monospace" }}
        value={query}
        onChange={e => setQuery(e.target.value)} // Обновление состояния при изменении текста
      />
      <div style={{ marginTop: 10 }}>
        <button onClick={execute}>Execute</button> {/* Кнопка запуска запроса */}
      </div>

      {/* Результат выполнения SQL-запроса */}
      {result && (
        <div style={{ marginTop: 30 }}>
          <strong>Результат запроса:</strong>
          <table border="1" cellPadding="5" style={{ marginTop: 10 }}>
            <thead>
              <tr>
                {result.columns.map(col => (
                  <th key={col}>{col}</th> // Заголовки результата
                ))}
              </tr>
            </thead>
            <tbody>
              {result.values.map((row, idx) => (
                <tr key={idx}>
                  {row.map((val, i) => (
                    <td key={i}>{val}</td> // Значения результата
                  ))}
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  );
}
