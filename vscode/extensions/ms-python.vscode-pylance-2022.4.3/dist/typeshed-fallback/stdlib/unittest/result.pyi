import unittest.case
from types import TracebackType
from typing import Any, Callable, TextIO, TypeVar, Union
from typing_extensions import TypeAlias

_SysExcInfoType: TypeAlias = Union[tuple[type[BaseException], BaseException, TracebackType], tuple[None, None, None]]

_F = TypeVar("_F", bound=Callable[..., Any])

STDOUT_LINE: str
STDERR_LINE: str

# undocumented
def failfast(method: _F) -> _F: ...

class TestResult:
    errors: list[tuple[unittest.case.TestCase, str]]
    failures: list[tuple[unittest.case.TestCase, str]]
    skipped: list[tuple[unittest.case.TestCase, str]]
    expectedFailures: list[tuple[unittest.case.TestCase, str]]
    unexpectedSuccesses: list[unittest.case.TestCase]
    shouldStop: bool
    testsRun: int
    buffer: bool
    failfast: bool
    tb_locals: bool
    def __init__(self, stream: TextIO | None = ..., descriptions: bool | None = ..., verbosity: int | None = ...) -> None: ...
    def printErrors(self) -> None: ...
    def wasSuccessful(self) -> bool: ...
    def stop(self) -> None: ...
    def startTest(self, test: unittest.case.TestCase) -> None: ...
    def stopTest(self, test: unittest.case.TestCase) -> None: ...
    def startTestRun(self) -> None: ...
    def stopTestRun(self) -> None: ...
    def addError(self, test: unittest.case.TestCase, err: _SysExcInfoType) -> None: ...
    def addFailure(self, test: unittest.case.TestCase, err: _SysExcInfoType) -> None: ...
    def addSuccess(self, test: unittest.case.TestCase) -> None: ...
    def addSkip(self, test: unittest.case.TestCase, reason: str) -> None: ...
    def addExpectedFailure(self, test: unittest.case.TestCase, err: _SysExcInfoType) -> None: ...
    def addUnexpectedSuccess(self, test: unittest.case.TestCase) -> None: ...
    def addSubTest(self, test: unittest.case.TestCase, subtest: unittest.case.TestCase, err: _SysExcInfoType | None) -> None: ...
