class OrderNotFoundError(Exception):
    pass


class OrderAlreadyCancelledError(Exception):
    pass


class OrderAlreadyPaidError(Exception):
    pass


class OrderCannotBeCancelledError(Exception):
    pass


class OrderCannotBePaidError(Exception):
    pass


class OrderCannotBeShippedError(Exception):
    pass
