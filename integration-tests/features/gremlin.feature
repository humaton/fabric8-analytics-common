Feature: Check the Gremlin instance and its behaviour

  @requires_access_to_graph_db
  Scenario: Check that the Gremlin is available
    Given System is running
    When I access Gremlin API
    Then I should get 200 status code
    Then I should get valid Gremlin response

  @requires_access_to_graph_db
  Scenario: Basic check for Gremlin ability to find vertexes
    Given System is running
    When I ask Gremlin to find all vertexes having property vertex_label set to foobar
    Then I should get 200 status code
     And I should get valid Gremlin response
     And I should get 0 vertexes

  @requires_access_to_graph_db
  Scenario: Basic check for Gremlin ability to find vertexes for given ecosystems
    Given System is running
    When I ask Gremlin to find number of vertexes for the ecosystem npm
    Then I should get 200 status code
     And I should get valid Gremlin response
     And I should find at least one such vertex
    When I ask Gremlin to find number of vertexes for the ecosystem go
    Then I should get 200 status code
     And I should get valid Gremlin response
     And I should find at least one such vertex
    When I ask Gremlin to find number of vertexes for the ecosystem pypi
    Then I should get 200 status code
     And I should get valid Gremlin response
     And I should find at least one such vertex
    When I ask Gremlin to find number of vertexes for the ecosystem maven
    Then I should get 200 status code
     And I should get valid Gremlin response
     And I should find at least one such vertex

  @requires_access_to_graph_db
  Scenario: Basic check for Gremlin ability to search for given package in any versions for the npm ecosystem
    Given System is running
    When I ask Gremlin to find all versions of the package sequence in the ecosystem npm
    Then I should get 200 status code
     And I should get valid Gremlin response
     And I should find the following properties (description, last_updated, pecosystem, pname, version, vertex_label) in all found packages
     And I should not find any property apart from (description, last_updated, pecosystem, pname, version, vertex_label, licenses) in all found packages
     And I should find that all found packages have valid timestamp with the last update time

  @requires_access_to_graph_db
  Scenario: Basic check for Gremlin ability to search for given package in any versions for the Maven ecosystem
    Given System is running
    When I ask Gremlin to find all versions of the package io.vertx:vertx-core in the ecosystem maven
    Then I should get 200 status code
     And I should get valid Gremlin response
     And I should find the following properties (description, last_updated, pecosystem, pname, version, vertex_label) in all found packages
     And I should find the following properties (cm_avg_cyclomatic_complexity, cm_loc, cm_num_files, dependents_count, shipped_as_downstream) in all found packages
     And I should find that all found packages have valid timestamp with the last update time

  @requires_access_to_graph_db
  Scenario: Basic check for Gremlin ability to search for given package in any versions for the Pypi ecosystem
    Given System is running
    When I ask Gremlin to find all versions of the package clojure_py in the ecosystem pypi
    Then I should get 200 status code
     And I should get valid Gremlin response
     And I should find the following properties (description, last_updated, pecosystem, pname, version, vertex_label) in all found packages
     And I should find that all found packages have valid timestamp with the last update time

  @requires_access_to_graph_db
  Scenario: Basic check for Gremlin ability to search for given package and version for the npm ecosystem
    Given System is running
    When I ask Gremlin to find the package sequence version 3.0.0 in the ecosystem npm
    Then I should get 200 status code
     And I should get valid Gremlin response
     And I should find the following properties (description, last_updated, pecosystem, pname, version, vertex_label) in all found packages
     And I should not find any property apart from (description, last_updated, pecosystem, pname, version, vertex_label, licenses) in all found packages
     And I should find that the pecosystem property is set to npm in the package properties
     And I should find that the pname property is set to sequence in the package properties
     And I should find that the version property is set to 3.0.0 in the package properties
     And I should find that the licenses property is set to Apache 2.0 in the package properties
     And I should find that all found packages have valid timestamp with the last update time

  @requires_access_to_graph_db
  Scenario: Basic check for Gremlin ability to search for given package and version for ecosystem Maven
    Given System is running
    When I ask Gremlin to find the package io.vertx:vertx-core version 3.4.0 in the ecosystem maven
    Then I should get 200 status code
     And I should get valid Gremlin response
     And I should find the following properties (description, last_updated, pecosystem, pname, version, vertex_label) in all found packages
     And I should find the following properties (cm_avg_cyclomatic_complexity, cm_loc, cm_num_files, dependents_count, shipped_as_downstream, relative_used) in all found packages
     And I should find that the pecosystem property is set to maven in the package properties
     And I should find that the pname property is set to io.vertx:vertx-core in the package properties
     And I should find that the version property is set to 3.4.0 in the package properties
     And I should find that all found packages have valid timestamp with the last update time

  @requires_access_to_graph_db
  Scenario: Basic check for Gremlin ability to search for given package and version for ecosystem Pypi
    Given System is running
    When I ask Gremlin to find the package clojure_py version 0.2.4 in the ecosystem pypi
    Then I should get 200 status code
     And I should get valid Gremlin response
     And I should find the following properties (description, last_updated, pecosystem, pname, version, vertex_label) in all found packages
     And I should find that the pecosystem property is set to pypi in the package properties
     And I should find that the pname property is set to clojure_py in the package properties
     And I should find that the version property is set to 0.2.4 in the package properties
     And I should find that all found packages have valid timestamp with the last update time

  @requires_access_to_graph_db
  Scenario: Basic check for Gremlin ability to search for given package in the npm ecosystem
    Given System is running
    When I ask Gremlin to find the package sequence in the ecosystem npm
    Then I should get 200 status code
     And I should get valid Gremlin response
     And I should find that all found packages have valid timestamp with the last update time

  @requires_access_to_graph_db
  Scenario: Basic check for Gremlin ability to search for given package in the Maven ecosystem
    Given System is running
    When I ask Gremlin to find the package io.vertx:vertx-core in the ecosystem maven
    Then I should get 200 status code
     And I should get valid Gremlin response
     And I should find that all found packages have valid timestamp with the last update time

  @requires_access_to_graph_db
  Scenario: Basic check for Gremlin ability to search for given package in the Pypi ecosystem
    Given System is running
    When I ask Gremlin to find the package clojure_py in the ecosystem pypi
    Then I should get 200 status code
     And I should get valid Gremlin response
     And I should find that all found packages have valid timestamp with the last update time

  @requires_access_to_graph_db
  Scenario: Basic check for Gremlin ability to search for given package
    Given System is running
    When I ask Gremlin to find the package sequence in the ecosystem npm
    Then I should get 200 status code
     And I should get valid Gremlin response

