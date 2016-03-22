# lib/tasks/auto_annotate_models.rake
if Rails.env.development?
  task :annotate do
    puts 'Annotating models...'
    system 'bundle exec annotate'
  end

  Rake::Task['db:migrate'].enhance do
    Rake::Task['annotate'].invoke
  end

  Rake::Task['db:rollback'].enhance do
    Rake::Task['annotate'].invoke
  end
end
