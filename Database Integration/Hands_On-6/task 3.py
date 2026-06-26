from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, joinedload
from models import Enrollment

DATABASE_URL = "postgresql+psycopg2://postgres:postgresql%40123@localhost:5432/college_db_orm"

engine = create_engine(DATABASE_URL, echo=True)

Session = sessionmaker(bind=engine)
session = Session()

print("----- Eager Loading using joinedload -----")

enrollments = session.query(Enrollment).options(
    joinedload(Enrollment.student),
    joinedload(Enrollment.course)
).all()

for e in enrollments:
    print(
        "Student:",
        e.student.first_name,
        e.student.last_name,
        "| Course:",
        e.course.course_name
    )

session.close()

print("Hands-On 6 Task 3 Completed")
