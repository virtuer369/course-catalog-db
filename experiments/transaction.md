# Transaction Experiment

## 1. Failed transaction

A student was inserted successfully, but the enrollment insert failed because the referenced course `no-such-course` did not exist.

PostgreSQL reported a foreign key violation (`enrollments_course_id_fkey`). The transaction entered an aborted state.

After executing `ROLLBACK`, the student count for `madina@example.com` was 0.

This confirmed that all operations inside the transaction were cancelled, including the successful first INSERT.

## 2. Successful transaction

A new student, Madina Ospanova, was inserted together with an enrollment in the `Web Security Essentials` course.

Both INSERT operations succeeded, and `COMMIT` saved the changes.

## 3. Transaction visibility across two connections

Two Query Tool windows were used to test transaction visibility.

| Stage | Window A | Window B: COUNT(*) |
|---|---|---:|
| Before COMMIT | Student and enrollment inserted, transaction open | 0 |
| After COMMIT | Transaction committed | 1 |

The second connection could not see uncommitted changes. After COMMIT, the new student became visible.

This demonstrates PostgreSQL's default READ COMMITTED isolation level.

## Conclusion

Transactions ensure atomicity: either all related operations are committed, or none of them are applied.

They also prevent other connections from seeing uncommitted changes.
