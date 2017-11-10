from PageObjectLibrary import PageObject

class DashboardPage(PageObject):
    PAGE_URL = "/dashboard.html"

    _locators = {
        "logout_link": "id=logout"
    }

    def _is_current_page(self):
        location = self.se2lib.get_location()
        if not location.endswith(self.PAGE_URL):
            message = "Expected location to end with " + \
                      self.PAGE_URL + " but it did not"
            raise Exception(message)
        return True

    def do_logout(self):
        with self._wait_for_page_refresh():
            self.se2lib.click_button(self.locator.logout_link)

