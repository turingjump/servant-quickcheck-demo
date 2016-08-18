# servant-quickcheck - Step 1

The first thing to do is to get the testing setup right. We do this in the
'test/Spec.hs' file. Since we want to initially test that two applications
match one another in behaviour, we need to start the two applications before
running the test (`serversEqual`). We also write a SQL file (`sql/schema.sql`)
that sets up our database schema.

# Running the tests

Run:

    stack test

Note that for now, `src/Linnaen.hs` is just a stub. It doesn't even typecheck,
since we don't yet have any endpoints and `servant` won't let us run an
application without endpoints. The next step is adding an endpoint.
