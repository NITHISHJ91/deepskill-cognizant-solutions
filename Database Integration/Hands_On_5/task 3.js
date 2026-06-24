// Hands-On 5 - Task 3
use("college_nosql");

print("Average Rating for Each Course");
db.feedback.aggregate([
    {
        $group: {
            _id: "$course_code",
            average_rating: { $avg: "$rating" }
        }
    }
]);

print("Feedback Count for Each Course");
db.feedback.aggregate([
    {
        $group: {
            _id: "$course_code",
            total_feedback: { $sum: 1 }
        }
    }
]);

print("Courses with Average Rating Greater Than 4");
db.feedback.aggregate([
    {
        $group: {
            _id: "$course_code",
            average_rating: { $avg: "$rating" }
        }
    },
    {
        $match: {
            average_rating: { $gt: 4 }
        }
    }
]);

print("Courses Sorted by Average Rating");
db.feedback.aggregate([
    {
        $group: {
            _id: "$course_code",
            average_rating: { $avg: "$rating" }
        }
    },
    {
        $sort: {
            average_rating: -1
        }
    }
]);

print("Course Code and Average Rating");
db.feedback.aggregate([
    {
        $group: {
            _id: "$course_code",
            average_rating: { $avg: "$rating" }
        }
    },
    {
        $project: {
            _id: 0,
            course_code: "$_id",
            average_rating: 1
        }
    }
]);

print("Hands-On 5 Task 3 Completed");