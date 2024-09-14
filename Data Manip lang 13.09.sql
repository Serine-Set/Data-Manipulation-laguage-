--Create Vehicles table 
CREATE TABLE Vehicles (
    VehicleID INT  PRIMARY KEY,
    LicensePlate VARCHAR(20) NOT NULL,
    Make VARCHAR(20) NOT NULL,
    Model VARCHAR(20) NOT NULL,
    Year INT NOT NULL,
    Color VARCHAR(20) NOT NULL,
    VIN VARCHAR(20) NOT NULL
    );

-- Insert records into the Vehicles table
INSERT INTO Vehicles (VehicleID, LicensePlate, Make, Model, Year, Color, VIN)
VALUES 
('1','ABC123', 'Toyota', 'Corolla', 2020, 'White', '1HGCM82633A004352'),
('2','XYZ789', 'Ford', 'Fusion', 2018, 'Blue', '2HGCM82633A004353');


--Create Drivers table 
CREATE TABLE Drivers (
    DriverID INT  PRIMARY KEY,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    LicenseNumber VARCHAR(20) NOT NULL,
    Phone VARCHAR(20) NOT NULL,
    Address VARCHAR(20) NOT NULL,
    City VARCHAR(20) NOT NULL,
    State VARCHAR(20) NOT NULL,
    ZipCode VARCHAR(20) NOT NULL
    );

-- Insert records into the Drivers table
INSERT INTO Drivers (DriverID,FirstName, LastName, LicenseNumber, Phone, Address, City, State, ZipCode)
VALUES 
('1','Michael', 'Smith', 'D1234567', '1234567890', '123 Main St', 'Anytown', 'CA', '12345'),
('2', 'Sarah', 'Connor', 'D7654321', '0987654321', '456 Elm St', 'Otherville', 'NY', '54321');


--Create Trips table 
CREATE TABLE Trips (
    TripID INT  PRIMARY KEY,
    VehicleID INT NOT NULL,
    DriverID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    StartLocation VARCHAR(20) NOT NULL,
    EndLocation VARCHAR(20) NOT NULL,
    Distance INT NOT NULL,
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID),
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
    );

-- Insert records into the Trips table
INSERT INTO Trips (TripID, VehicleID, DriverID, StartDate, EndDate, StartLocation, EndLocation, Distance)
VALUES 
('1','1', '1', '2024-07-01', '2024-07-02', 'Los Angeles', 'San Francisco', 380),
('2','2', '2', '2024-07-03', '2024-07-04', 'New York', 'Washington D.C.', 225);



--Create Maintenance table 
CREATE TABLE Maintenance (
    MaintenanceID INT  PRIMARY KEY,
    VehicleID INT NOT NULL,
    MaintenanceDate DATE NOT NULL,
    Description VARCHAR(20) NOT NULL,
    Cost float NOT NULL,
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID)
    );

-- Insert records into the Maintenance table
INSERT INTO Maintenance (MaintenanceID,VehicleID, MaintenanceDate, Description, Cost)
VALUES 
('1','1', '2024-06-15', 'Oil change', 50.00),
('2','2', '2024-06-20', 'Tire replacement', 300.00);

select * from Vehicles
select * from Maintenance
select * from Drivers
select * from Trips


--Update the cost of the second maintenance record to 350.00.
UPDATE Maintenance
SET Cost = 350.00
WHERE VehicleID = 2 


--delete vehicle 1 from table vehicles
delete from Maintenance
where VehicleID = '1';

delete from Trips
where VehicleID = '1';

delete from Vehicles
where VehicleID = '1';



-- Insert one more record into the Trips table 
INSERT INTO Trips (TripID, VehicleID, DriverID, StartDate, EndDate, StartLocation, EndLocation, Distance)
VALUES 
('3','2','1', '2024-07-05', '2024-07-06','Boston', 'Philadelphia', '300');


--Update the color of the second vehicle in the Vehicles table to "Red".
update Vehicles
set Color = 'red'
where VehicleID = 2; 


--Insert a new maintenance record into the Maintenance table 
INSERT INTO Maintenance (MaintenanceID, VehicleID, MaintenanceDate, Description, Cost)
VALUES 
('3','2', '2024-07-10', 'Brake inspection', '100');


--Update the phone number of the first driver in the Drivers table to "2223334444".
update Drivers
set Phone = '2223334444'
where DriverID = '1'


--Delete  TripID = 2 from the Trips table.
delete from Trips
where TripID = '2'

