// 1.	Из коллекции customers выяснить из какого города "Sven Ottlieb"

{
    filter: {
        ContactName: 'Sven Ottlieb'
    },
    project: {
        City: 1,
        ContactName: 1
    }
}

// 2.	Из коллекции ich.US_Adult_Income найти возраст самого взрослого человека

{
    sort: {
        age: -1
    },
    project: {
        age: 1,
            _id: 0
    },
    limit: 1
}


// 3.	Из 2 задачи выясните, сколько человек имеют такой же возраст
// Ответ: 43

// 4.	Найти _id ObjectId документа, в котором education " IT-career-hub"

{
    filter: {
        education: ' IT-career-hub'
    },
    project: {
        _id: 1
    }
}

// 5.	Выяснить количество людей в возрасте между 20 и 30 годами

{
    filter: {
        age: {
            $gte: 20,
                $lte: 30
        }
    }
}