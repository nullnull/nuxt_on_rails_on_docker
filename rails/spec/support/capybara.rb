def console_logs_raw
  page.driver.browser.manage.logs.get(:browser)
end

def console_logs(ignore: nil)
  # 本当は500なども表示したいが、afterフックで実行される時、CI上の表示がRSpec::Core::MultipleExceptionErrorになって見辛いので非表示とする
  console_logs_raw
    .map(&:message)
    .reject { |x| x.include?('hot-update.js') }
    .reject { |x| x.include?('the server responded with a status of 500') }
    .reject { |x| x.include?('The response had HTTP status code 500') }
    .reject { |x| x.include?('"%cerror"') }
    .reject { |x| ignore.present? ? x.include?(ignore) : false }
end

def console_logs_formatted(ignore: nil)
  console_logs(ignore: ignore)
    .map.with_index { |x, i| "#{i + 1}.\n" + x.gsub('\\n', "\n").gsub('\\u003C', '<') }
    .join("\n\n")
end
