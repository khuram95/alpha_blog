require 'test_helper'
class CategoriesControllerTest< ActionController::TestCase
    def setup
         @category = Category.create(name: "football")
    end
    test 'should get categories index' do
        get :index
        assert_response :success
    end
    test 'should get categories new' do
      get :new
      assert_response :success
    end
    test 'should get categories show' do
      get(:show,{'id'=>@category.id}) 
    end
end