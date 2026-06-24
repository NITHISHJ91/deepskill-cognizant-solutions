// ==============================
// Hands-On 5 - Task 2
// CRUD Operations
// ==============================

// 1. Find all feedback with rating = 5
print("----- Query 1 -----");
db.feedback.find({ rating: 5 });

// 2. Find feedback for CS101 containing the tag "challenging"
print("----- Query 2 -----");
db.feedback.find({
    course_code: "CS101",
    tags: "challenging"
});

// 3. Display only student_id, course_code and rating
print("----- Query 3 -----");
db.feedback.find(
    {},
    {
        student_id: 1,
        course_code: 1,
        rating: 1,
        _id: 0
    }
);

// 4. Add needs_review = true where rating < 3
print("----- Query 4 -----");
db.feedback.updateMany(
    { rating: { $lt: 3 } },
    {
        $set: {
            needs_review: true
        }
    }
);

// 5. Add "reviewed" tag for documents needing review
print("----- Query 5 -----");
db.feedback.updateMany(
    { needs_review: true },
    {
        $push: {
            tags: "reviewed"
        }
    }
);

// 6. Delete all documents where semester = "2021-EVEN"
print("----- Query 6 -----");
db.feedback.deleteMany({
    semester: "2021-EVEN"
});

print("===== Hands-On 5 Task 2 Completed =====");