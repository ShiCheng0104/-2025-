USE MyDb;

-- (1) 为表Staff添加主码
ALTER TABLE Staff 
ADD CONSTRAINT PK_Staff PRIMARY KEY (staffNo);

-- (2) Dept.mgrStaffNo是外码，对应Staff.staffNo，添加外码约束
ALTER TABLE Dept 
ADD CONSTRAINT FK_Dept_mgrStaffNo FOREIGN KEY (mgrStaffNo) REFERENCES Staff(staffNo);

-- (3) Staff.dept是外码，对应Dept.deptNo，添加外码约束
ALTER TABLE Staff 
ADD CONSTRAINT FK_Staff_dept FOREIGN KEY (dept) REFERENCES Dept(deptNo);

-- (4) 为表Staff添加check约束，gender只能是F或M
ALTER TABLE Staff 
ADD CONSTRAINT CK_Staff_gender CHECK (gender IN ('F', 'M'));

-- (5) 为表Dept添加unique约束，deptName不能重复
ALTER TABLE Dept 
ADD CONSTRAINT UN_Dept_deptName UNIQUE (deptName);
