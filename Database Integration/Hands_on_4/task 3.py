# ===========================================
# HANDS-ON 4 - TASK 3
# Python + PostgreSQL
# ===========================================

import psycopg2

# Connect to PostgreSQL
conn = psycopg2.connect(
    host="localhost",
    database="db1",
    user="postgres",
    password="postgresql@123"
)

cur = conn.cursor()
cur.execute("SELECT current_database();")
print("Database:", cur.fetchone()[0])

cur.execute("SELECT current_schema();")
print("Schema:", cur.fetchone()[0])

# -------------------------------------------------
# Step 56: N+1 Query Problem
# -------------------------------------------------

print("----- N+1 Query Problem -----")

cur.execute("""
SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_type = 'BASE TABLE'
ORDER BY table_schema, table_name;
""")

tables = cur.fetchall()

for table in tables:
    print(table)
students = cur.fetchall()

for student in students:
    student_id = student[0]
    print(f"\nStudent: {student[1]} {student[2]}")

    cur.execute("""
        SELECT c.course_name
        FROM enrollments e
        JOIN courses c
        ON e.course_id = c.course_id
        WHERE e.student_id = %s;
    """, (student_id,))

    courses = cur.fetchall()

    for course in courses:
        print("Course:", course[0])

# -------------------------------------------------
# Step 57 & 58: Optimized Query (Single JOIN)
# -------------------------------------------------

print("\n\n----- Optimized Query -----")

cur.execute("""
SELECT
    s.first_name,
    s.last_name,
    c.course_name
FROM students s
JOIN enrollments e
ON s.student_id = e.student_id
JOIN courses c
ON e.course_id = c.course_id
ORDER BY s.student_id;
""")

rows = cur.fetchall()

for row in rows:
    print(f"{row[0]} {row[1]} --> {row[2]}")

# -------------------------------------------------
# Step 59: Close Connection
# -------------------------------------------------

cur.close()
conn.close()

print("\nDatabase connection closed.")
