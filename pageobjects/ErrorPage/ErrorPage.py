from PageObjectLibrary import PageObject

class ErrorPage(PageObject):

    EXPECTED_TO_CONTAIN="Error"

    _locators = {
        "header_container": "id=container"
    }

    def _is_current_page(self):
        page_text = self.se2lib.get_text(self.locator.header_container)
        print("pero" + page_text)
        if self.EXPECTED_TO_CONTAIN not in page_text:
            message = "Expected that text on the page contains " + \
                      self.EXPECTED_TO_CONTAIN + " but it did not "
            raise Exception(message)
        return True


