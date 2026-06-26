from sqlalchemy import create_engine, Column, Integer, String, Float, ForeignKey
from sqlalchemy.orm import declarative_base, sessionmaker

DATABASE_URL = "postgresql+psycopg2://postgres:postgresql%40123@localhost:5432/college_db_orm"

engine = create_engine(DATABASE_URL)
Session = sessionmaker(bind=engine)
session = Session()

Base = declarative_base()


class Department(Base):
    __tablename__ = "departments"

    department_id = Column(Integer, primary_key=True)
    department_name = Column(String(100))
    budget = Column(Float)


class Student(Base):
    __tablename__ = "students"

    student_id = Column(Integer, primary_key=True)
    first_name = Column(String(50))
    last_name = Column(String(50))
    email = Column(String(100))
    department_id = Column(Integer, ForeignKey("departments.department_id"))


# -------------------------
# CREATE
# -------------------------
dept = Department(
    department_id=1,
    department_name="Computer Science",
    budget=500000
)

student = Student(
    student_id=101,
    first_name="Nithish",
    last_name="J",
    email="nithish@example.com",
    department_id=1
)

session.add(dept)
session.add(student)
session.commit()

print("Records inserted successfully.")

# -------------------------
# READ
# -------------------------
print("\nStudent Records")
students = session.query(Student).all()

for s in students:
    print(s.student_id, s.first_name, s.last_name, s.email)

# -------------------------
# UPDATE
# -------------------------
student = session.query(Student).filter_by(student_id=101).first()

if student:
    student.email = "nithishj@example.com"
    session.commit()
    print("\nStudent email updated successfully.")

# -------------------------
# DELETE
# -------------------------
student = session.query(Student).filter_by(student_id=101).first()

if student:
    session.delete(student)
    session.commit()
    print("Student record deleted successfully.")

session.close()
