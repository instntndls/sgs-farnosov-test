CREATE TABLE Containers (
    ContainerID UNIQUEIDENTIFIER PRIMARY KEY,
    Number INT,
    Type NVARCHAR(100),
    Length DECIMAL(10, 2),
    Width DECIMAL(10, 2),
    Height DECIMAL(10, 2),
    Weight DECIMAL(10, 2),
    IsEmpty BIT,
    ArrivalDate DATETIME
);

-- Скрипт для создания таблицы Операции
CREATE TABLE Operations (
    OperationID UNIQUEIDENTIFIER PRIMARY KEY,
    ContainerID UNIQUEIDENTIFIER,
    StartDate DATETIME,
    EndDate DATETIME,
    OperationType NVARCHAR(100),
    OperatorName NVARCHAR(100),
    InspectionPlace NVARCHAR(100)
);

-- Запрос для выборки данных из таблицы Контейнеры в формате JSON
SELECT
    '[' + STRING_AGG(
        '{' +
        '"ContainerID": "' + CONVERT(NVARCHAR, ContainerID) + '",' +
        '"Number": ' + CONVERT(NVARCHAR, Number) + ',' +
        '"Type": "' + Type + '",' +
        '"Length": ' + CONVERT(NVARCHAR, Length) + ',' +
        '"Width": ' + CONVERT(NVARCHAR, Width) + ',' +
        '"Height": ' + CONVERT(NVARCHAR, Height) + ',' +
        '"Weight": ' + CONVERT(NVARCHAR, Weight) + ',' +
        '"IsEmpty": ' + CONVERT(NVARCHAR, IsEmpty) + ',' +
        '"ArrivalDate": "' + CONVERT(NVARCHAR, ArrivalDate, 126) + '"' +
        '}' , ',') +
    ']' AS ContainersJSON
FROM Containers;

-- Запрос для выборки данных из таблицы Операции для не пустых контейнеров
SELECT
    '[' + STRING_AGG(
        '{' +
        '"OperationID": "' + CONVERT(NVARCHAR, o.OperationID) + '",' +
        '"ContainerID": "' + CONVERT(NVARCHAR, o.ContainerID) + '",' +
        '"StartDate": "' + CONVERT(NVARCHAR, o.StartDate, 126) + '",' +
        '"EndDate": "' + CONVERT(NVARCHAR, o.EndDate, 126) + '",' +
        '"OperationType": "' + o.OperationType + '",' +
        '"OperatorName": "' + o.OperatorName + '",' +
        '"InspectionPlace": "' + o.InspectionPlace + '"' +
        '}' , ',') +
    ']' AS OperationsJSON
FROM Operations o
JOIN Containers c ON o.ContainerID = c.ContainerID
WHERE c.IsEmpty = 0;