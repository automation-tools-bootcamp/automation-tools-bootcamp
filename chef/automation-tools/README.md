# automation-tools default cookbook

A bare* cookbook having used the `chef generate cookbook` command.

1. Edit the `recipes/default.rb` file to install Apache 2 using the `apache2` [package](https://docs.chef.io/resource_package.html).
2. Converge the Test Kitchen node `kitchen converge`
3. Browse to the VM in your browser. [http://localhost:8080](http://localhost:8080).
4. [Connect to the VM via SSH](http://kitchen.ci/docs/getting-started/getting-help) `kitchen ???` and then stop the Apache server from running `sudo service apache2 stop` and reload the webpage.

* The `.kitchen.yml` file has been edited from a default Test Kitchen file to instead just have Ubuntu but also adding in port mapping to view the default Apache page.