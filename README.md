# servant-quickcheck - Step 2

We start with a single endpoint.

    type LinnaenAPI = "family" :> Get '[JSON] [Family]

We haven't implemented it yet:

    linnaenServer :: DBSettings -> IO (Server LinnaenAPI)
    linnaenServer = error "not implemented"

Which our tests immediately notice:

    $ stack test

    the application
      should match the behaviour of the legacy application FAILED [1]

    Failures:

      test/Spec.hs:24:
      1) the application should match the behaviour of the legacy application
           uncaught exception: ErrorCall (not implemented)

    Randomized with seed 294547665

    Finished in 0.6558 seconds
    1 example, 1 failure


Let's actually implement it.
