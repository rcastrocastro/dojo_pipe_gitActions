Before do
  @service = ->(klass) { klass.new }
end

After do |scenario|
  exception_message(scenario)
end

def exception_message(scenario)
  scene = scenario.failed?
  return unless scene == true

  puts "\n--------------------------------------------------------------------------------------------"
  puts 'Reason:'
  puts "\n - Request  body: #{@payload.to_json}"
  puts "\n - Response code: #{@response.response.code}"
  puts "\n - Response body: #{@response.parsed_response.to_json}"
  puts "\n🐞🐞🐞🐞🐞🐞🐞 #{scenario.exception.message}"
  puts "--------------------------------------------------------------------------------------------\n"
end

AfterConfiguration do |config|
  config.on_event(:test_case_finished) do |event|
    puts "\n--------------------------------------------------------------------------------------------------"
    puts 'Results:'
    puts " - Scenario......: #{event.test_case.name}"
    puts " - The results is: #{event.result}"
    puts "--------------------------------------------------------------------------------------------------\n"
  end
end

at_exit do
  @infos = {
    'Data do Teste' => Time.now.strftime('%d/%B/%Y'),
    'Hora do Teste' => Time.now.strftime('%HH%MM%SS')
  }
  ReportBuilder.configure do |config|
    config.input_path = 'report/report.json'
    config.report_path = 'report/report'
    config.report_types = [:html]
    config.include_images = true
    config.report_title = '[Dojo] - Automação API / 2 parte do dojo sobre HTTParty'
    config.additional_info = @infos
    config.color = 'indigo'
  end
  ReportBuilder.build_report
end
