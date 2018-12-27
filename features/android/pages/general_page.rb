require 'calabash-android/abase'

class GeneralPage < Calabash::ABase

  def assert_app_is_runned
    wait_for do
      !query("*").empty?
    end
  end


  def remove_ads
    sleep(0.3)
    wait_for_element_exists("* marked:'Продолжить'")
    sleep(2)
    touch("* marked:'Продолжить'")
    sleep(3)
  end


  def goto_profile
    sleep(0.3)
    wait_for_element_exists("* marked:'Профиль'")
    sleep(2)
    touch("* marked:'Профиль'")
    sleep(3)
  end

  def login
    sleep(0.3)
    wait_for_element_exists("* marked:'Войти'")
    sleep(2)
    touch("* marked:'Войти'")
    sleep(3)
    enter_valid_credentials
    search_for
  end

  def enter_valid_credentials
    sleep(0.3)
    touch("* marked:'Email'")
    keyboard_enter_text("omka3s@gmail.com")
    hide_soft_keyboard

    touch("* marked:'Пароль'")
    keyboard_enter_text("homework")
    hide_soft_keyboard
    sleep(3)
    touch("android.support.v7.widget.AppCompatButton; id:'login'")
    
  end

  def search_for
    sleep(6)
    touch("* marked:'Перейти вверх'")
    
    sleep(5)
    touch("* marked:'Еда'")
    sleep(5)
    touch("* marked:'Поиск'")
    sleep(5)
    keyboard_enter_text("Фаиза")
    sleep(5)
    
    wait_for_element_exists("android.support.v7.widget.AppCompatTextView text:'Фаиза'")
  end

end

