# Transaction Experiment

## Failed transaction

A student was inserted successfully, but the enrollment insert
failed because the referenced course did not exist.

After ROLLBACK, the student count was 0.

This confirmed that all operations inside the transaction
were cancelled, including the successful first INSERT.

## Successful transaction

A new student, Madina Ospanova, was inserted together with
an enrollment in the Web Security Essentials course.

Both INSERT operations succeeded, and COMMIT saved the changes.

## Conclusion

Transactions ensure atomicity: either all related operations
are committed, or none of them are applied.