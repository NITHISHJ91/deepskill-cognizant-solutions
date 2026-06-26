from sqlalchemy import create_engine, Column, Integer, String, Float, ForeignKey
from sqlalchemy.orm import declarative_base

DATABASE_URL = DATABASE_URL = "postgresql+psycopg2://postgres:postgresql%40123@localhost:5432/college_db_orm"

engine = create_engine(DATABASE_URL)

Base = declarative_base()


class Department(Base):
    __tablename__ = "departments"

    department_id = Column(Integer, primary_key=True)
    department_name = Column(String(100), nullable=False)
    budget = Column(Float)


class Student(Base):
    __tablename__ = "students"

    student_id = Column(Integer, primary_key=True)
    first_name = Column(String(50))
    last_name = Column(String(50))
    email = Column(String(100))
    department_id = Column(Integer, ForeignKey("departments.department_id"))


class Professor(Base):
    __tablename__ = "professors"

    professor_id = Column(Integer, primary_key=True)
    first_name = Column(String(50))
    last_name = Column(String(50))
    department_id = Column(Integer, ForeignKey("departments.department_id"))


class Course(Base):
    __tablename__ = "courses"

    course_id = Column(Integer, primary_key=True)
    course_name = Column(String(100))
    department_id = Column(Integer, ForeignKey("departments.department_id"))


class Enrollment(Base):
    __tablename__ = "enrollments"

    enrollment_id = Column(Integer, primary_key=True)
    student_id = Column(Integer, ForeignKey("students.student_id"))
    course_id = Column(Integer, ForeignKey("courses.course_id"))
    grade = Column(String(5))


Base.metadata.create_all(engine)

print("All tables created successfully.")
