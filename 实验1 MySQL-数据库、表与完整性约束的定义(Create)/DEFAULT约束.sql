# 请在以下空白处填写完成任务的语句，空白行可通过回车换行添加。
# 你也可以在命令行窗口完成任务，不过，在命令行键入的语句不会被保存。

DROP DATABASE MyDb;
CREATE DATABASE MyDb;
USE MyDb;

CREATE TABLE hr (
    id CHAR(10) PRIMARY KEY,
    name VARCHAR(32) NOT NULL,
    mz CHAR(16) DEFAULT '汉族'
);



# 结束 