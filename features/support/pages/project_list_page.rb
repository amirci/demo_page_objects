class ProjectListPage
    include PageObject
    
    def navigate
      visit('/projects')
    end
    
    def projects
      all(:css, "#projects tr").
        drop(1). #drop the header
        map { |r| r.all(:css, 'td').map { |node| node.text } }.
        map { |r| { name: r[0], description: r[1] } }
    end
end
