JOINS --
+--------------+---------------------------------------------------------------------+-------------------------------------------+
|    CLAUSE    |                        DETAILS                      |                   DEMO                    |
+--------------+---------------------------------------------------------+-------------------------------------------+
|  INNER JOIN  |                    |                               |
+--------------+--------------------------------------------------------------------+-------------------------------------------+
|  OUTER JOIN  |              |                              |
+--------------+-----------+---------------------------------------------------------+-------------------------------------------+
|  LEFT JOIN   |                  |                                 |
+--------------+-----------+---------------------------------------------------------+-------------------------------------------+
|  RIGHT JOIN  |                |                              |
+--------------+-----------+---------------------------------------------------------+-------------------------------------------+
|  SELF JOIN   |                 |                       |
+--------------+-----------+---------------------------------------------------------+-------------------------------------------+
|  JOIN        |                 |                       |
+--------------+-----------+---------------------------------------------------------+-------------------------------------------+
|  FULL JOIN   |                 |                       |
+--------------+-----------+---------------------------------------------------------+-------------------------------------------+

Students --                                                   University_Details --                 Ranks --
+------------+--------------+--------------+--------+         +------------+--------------+         +------------+-----------+--------+          
| Student_Id | Student_Name | Passing_year | Grades |         |     Id     |    Uni_Name  |         | University |   Course  |  Rank  |  
+------------+--------------+--------------+--------+         +------------+--------------+         +------------+-----------+--------+   
|      1     |       A      |     S2024    |   3.0  |         |      2     |      LMU     |         |     LMU    |    DS     |    4   | 
+------------+--------------+--------------+--------+         +------------+--------------+         +------------+-----------+--------+   
|      2     |       B      |     F2023    |   4.0  |         |      3     |      PSU     |         |     PSU    |    PSY    |    5   |  
+------------+--------------+--------------+--------+         +------------+--------------+         +------------+-----------+--------+   
|      3     |       C      |     F2022    |   3.7  |         |      1     |      JKU     |         |     XYU    |    CS     |    6   |  
+------------+--------------+--------------+--------+         +------------+--------------+         +------------+-----------+--------+   
|      4     |       D      |     S2025    |   3.0  |         |      5     |      XYU     |         |     IJU    |    ARCH   |    2   |  
+------------+--------------+--------------+--------+         +------------+--------------+         +------------+-----------+--------+   
|      5     |       E      |     NULL     |   2.5  |         |      4     |      IJU     |         |     JKU    |    BS     |    1   |  
+------------+--------------+--------------+--------+         +------------+--------------+         +------------+-----------+--------+   
                                                                                                    |     LMN    |    ML     |    3   | 
                                                                                                    +------------+-----------+--------+ 

---------- INNER JOIN ----------

/* 
INNER JOIN -
Select the University along with the Student
*/
SELECT Uni_Name, Student_Name
FROM University_Details
  INNER JOIN Students
    ON (Students.Student_Id = University_Details.Id);
+------------+--------------+ 
|  Uni_Name  | Student_Name |  
+------------+--------------+ 
|     LMU    |       B      |    
+------------+--------------+ 
|     PSU    |       C      |     
+------------+--------------+ 
|     JKU    |       A      |   
+------------+--------------+ 
|     XYU    |       E      |    
+------------+--------------+ 
|     IJU    |       D      |   
+------------+--------------+

/* 
INNER JOIN -
Select the Course along with the Students
*/
SELECT Course
FROM Ranks
  JOIN University_Details
    ON (Ranks.University = University_Details.Uni_Name)
    JOIN Students
      ON (University_Details.Id = Students.Student_Id)
+------------+--------------+ 
|   Course   | Student_Name |  
+------------+--------------+ 
|     DS     |       B      |    
+------------+--------------+ 
|     PSY    |       C      |     
+------------+--------------+ 
|     CS     |       A      |   
+------------+--------------+ 
|    ARCH    |       E      |    
+------------+--------------+ 
|     BS     |       D      |   
+------------+--------------+

/* 
INNER JOIN -
Select the Course for the student B 
*/
SELECT Course
FROM Ranks
  JOIN University_Details
    ON (Ranks.University = University_Details.Uni_Name)
    JOIN Students
      ON (University_Details.Id = Students.Student_Id)
      
WHERE Student_Name = "B"
+------------+--------------+ 
|   Course   | Student_Name |  
+------------+--------------+ 
|     DS     |       B      |    
+------------+--------------+ 

_________________________________________________________________________________________________________________________________________
