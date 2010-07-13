# To change this template, choose Tools | Templates
# and open the template in the editor.

module Pip

  def make_redundant
    self.available = false
    self.data_status_code = -1
  end

protected

  def Pip.testy_test
    @pip_test = 'Hello'
  end
end
