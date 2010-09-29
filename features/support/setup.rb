require 'spec/expectations'
$LOAD_PATH.unshift './lib'
require 'recloner'

COUCHDB_SERVER   = CouchRest.new "http://@localhost:5984"
RECLONER_TEST_DB = COUCHDB_SERVER.database!('recloner_test')

class Book < CouchRest::Model::Base
  include Recloner
  use_database RECLONER_TEST_DB
  
  property :name
  property :published, TrueClass
  view_by :name
end

After do |scenario|
  RECLONER_TEST_DB.delete!
  RECLONER_TEST_DB.create!
end
