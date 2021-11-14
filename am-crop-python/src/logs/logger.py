import logging
import os

LOGGER_LEVEL = os.getenv('LOGGER_LEVEL', 'INFO')

LEVELS = {'ERROR': logging.ERROR,
          'WARN': logging.WARN,
          'INFO': logging.INFO,
          'DEBUG': logging.DEBUG}


class AppLogger(logging.Logger):

    def __init__(self, name):
        super().__init__(name)

    def debug(self, msg, *args):
        if self.isEnabledFor(logging.DEBUG):
            self._log(logging.DEBUG, msg, args)

    def info(self, msg, *args):
        if self.isEnabledFor(logging.INFO):
            self._log(logging.INFO, msg, args)

    def warn(self, msg, *args):

        if self.isEnabledFor(logging.WARN):
            self._log(logging.WARN, msg, args)

    def error(self, msg, *args):

        if self.isEnabledFor(logging.ERROR):
            self._log(logging.ERROR, msg, args)

    def init(self):
        self.setLevel(LEVELS.get(LOGGER_LEVEL, logging.INFO))
        ch = logging.StreamHandler()
        formatter = logging.Formatter(
                '{"level":"%(levelname)s", "thread":"%(process)d-%(thread)d", "service":"%(name)s", ' +
                ' "message":"%(filename)s:%(lineno)d - %(message)s"}')
        ch.setFormatter(formatter)
        self.handlers = [ch]


def get_logger(name):
    return AppLogger(name)
