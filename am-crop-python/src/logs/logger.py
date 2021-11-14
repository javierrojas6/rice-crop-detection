import logging
import os

LOGGER_LEVEL = os.getenv('LOGGER_LEVEL', 'INFO')

LEVELS = {'ERROR': logging.ERROR,
          'WARN': logging.WARN,
          'INFO': logging.INFO,
          'DEBUG': logging.DEBUG}


class AppLogger(logging.Logger):

    def __init__(self, name, session_id=None):
        super().__init__(name)
        self.session_id = session_id
        if session_id is not None:
            self.session_enabled = True
        else:
            self.session_enabled = False
        self.init(self.session_enabled)

    def debug(self, msg, *args, session_id=None):
        if self.isEnabledFor(logging.DEBUG):
            self._log(logging.DEBUG, msg, args,
                      extra=self.get_extra_parameter(self.get_session_id(session_id)))

    def info(self, msg, *args, session_id=None):
        if self.isEnabledFor(logging.INFO):
            self._log(logging.INFO, msg, args,
                      extra=self.get_extra_parameter(self.get_session_id(session_id)))

    def warn(self, msg, *args, session_id=None):

        if self.isEnabledFor(logging.WARN):
            self._log(logging.WARN, msg, args,
                      extra=self.get_extra_parameter(self.get_session_id(session_id)))

    def error(self, msg, *args, session_id=None):

        if self.isEnabledFor(logging.ERROR):
            self._log(logging.ERROR, msg, args,
                      extra=self.get_extra_parameter(self.get_session_id(session_id)))

    def get_extra_parameter(self, session_id=None):
        extra = None
        if self.session_enabled and session_id is not None:
            extra = {'session_id': session_id}
        else:
            extra = {}
        return extra

    def get_session_id(self, session_id=None):
        result = None
        if session_id is not None:
            result = session_id
        elif self.session_id is not None:
            result = self.session_id
        return result

    def init(self, session_enabled=False):
        self.setLevel(LEVELS.get(LOGGER_LEVEL, logging.INFO))
        ch = logging.StreamHandler()
        formatter = None
        self.session_enabled = session_enabled
        if session_enabled:
            formatter = logging.Formatter(
                '{"level":"%(levelname)s", "thread":"%(process)d-%(thread)d", "service":"%(name)s", ' +
                ' "sessionId":"%(session_id)s", "message":"%(filename)s:%(lineno)d - %(message)s"}')
        else:
            formatter = logging.Formatter(
                '{"level":"%(levelname)s", "thread":"%(process)d-%(thread)d", "service":"%(name)s", ' +
                '"message":"%(filename)s:%(lineno)d - %(message)s"}')
        ch.setFormatter(formatter)
        self.handlers = [ch]


def get_logger(name, session_id=None):
    return AppLogger(name, session_id)
