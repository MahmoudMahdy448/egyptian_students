--Run this script on the Azure Synapse SQL Pool
-- Fact Table: Student Performance
CREATE TABLE Fact_Student_Performance (
    Student_ID INT NOT NULL,
    Education_Type_ID INT NOT NULL,
    Father_Degree_ID INT,
    Mother_Degree_ID INT,
    Subject_1_Grade FLOAT,
    Subject_2_Grade FLOAT,
    Subject_3_Grade FLOAT,
    Subject_4_Grade FLOAT,
    Subject_5_Grade FLOAT,
    Subject_6_Grade FLOAT,
    Subject_7_Grade FLOAT,
    Subject_8_Grade FLOAT,
    Subject_9_Grade FLOAT,
    Subject_10_Grade FLOAT,
    CONSTRAINT UQ_Fact_Student_Performance UNIQUE (Student_ID, Education_Type_ID) NOT ENFORCED
);

-- Dimension Table: Students
CREATE TABLE Dim_Student (
    Student_ID INT IDENTITY(1,1),
    Student_Name NVARCHAR(50),
    Student_Age INT,
    Student_Year NVARCHAR(20),
    CONSTRAINT UQ_Dim_Student UNIQUE (Student_ID) NOT ENFORCED
);

-- Dimension Table: Education Type
CREATE TABLE Dim_Education_Type (
    Education_Type_ID INT IDENTITY(1,1),
    Education_Type NVARCHAR(50),
    CONSTRAINT UQ_Dim_Education_Type UNIQUE (Education_Type_ID) NOT ENFORCED
);

-- Dimension Table: Parental Education (Father)
CREATE TABLE Dim_Parental_Education_Father (
    Father_Degree_ID INT IDENTITY(1,1),
    Father_Degree NVARCHAR(50),
    CONSTRAINT UQ_Dim_Parental_Education_Father UNIQUE (Father_Degree_ID) NOT ENFORCED
);

-- Dimension Table: Parental Education (Mother)
CREATE TABLE Dim_Parental_Education_Mother (
    Mother_Degree_ID INT IDENTITY(1,1),
    Mother_Degree NVARCHAR(50),
    CONSTRAINT UQ_Dim_Parental_Education_Mother UNIQUE (Mother_Degree_ID) NOT ENFORCED
);

-- Fact Table Foreign Key Relationships
-- Azure Synapse does not support enforced foreign key constraints,
-- so relationships must be handled through ETL or business logic.
