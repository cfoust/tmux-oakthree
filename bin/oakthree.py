"""
Handy utilities that might be useful across oakthree scripts.
"""

import libtmux

OAKTHREE_SESSION_NAME  = 'ot'
OAKTHREE_EDITOR_SUFFIX = ''
OAKTHREE_SHELL_SUFFIX  = '~'

def remove_window(session, name):
    """
    Remove a window only if it exists in the session.
    """
    window = session.find_where({'window_name' : name})

    if not window:
        return

    window.kill_window()

class ServerWrapper:
    """
    Wrap the server with some useful functionality.
    """

    def __init__(self, server):
        self.server = server

    def get_session(self, name=None):
        """
        Get a session by name. If name is excluded, gets the session of
        the pane executing this script.
        """
        if not name:
            name = self.server.cmd('display-message', '-p', '#S').stdout[0]
            return self.get_session(name)

        return self.server.find_where({'session_name' : name})

    def session_exists(self, name):
        """
        Check whether a session exists.
        """
        return not not self.get_session(name)

    def ensure_session(self, name):
        """
        Get a session, creating it if it doesn't exist.
        """
        session = self.get_session(name)

        if not session:
            return self.server.new_session(session_name=name, attach=False)

        return session

    def display_message(self, text):
        return self.server.cmd('display-message', '-p', text).stdout[0]

