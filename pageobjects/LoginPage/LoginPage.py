from PageObjectLibrary import PageObject

class LoginPage(PageObject):
    PAGE_URL = "/index.html"

    _locators = {
        "username": "id=username_field",
        "password" : "id=password_field",
        "submit_button": "id=login_button"
    }

    def _is_current_page(self):
        location = self.se2lib.get_location()
        if not location.endswith(self.PAGE_URL):
            message = "Expected location to end with " + \
                      self.PAGE_URL + " but it did not"
            raise Exception(message)
        return True

    def enter_username(self, username):
        """Type the given text into the username field """
        self.se2lib.input_text(self.locator.username, username)

    def enter_password(self, password):
        """Type the given text into the password field"""
        self.se2lib.input_text(self.locator.password, password)

    def click_login_button(self):
        with self._wait_for_page_refresh():
            self.se2lib.click_button(self.locator.submit_button)
