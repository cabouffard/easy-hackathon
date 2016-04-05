module TeamsHelper
  def status_list
    statusus = []
    I18n.t('teams.status').each do |status|
      statusus << [status[1], status[0]]
    end

    statusus
  end
end
