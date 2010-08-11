#Introduction

Exposes a "Recloner" module containing a "clone" method that you can mixin to your CouchRest::Model::Base derived objects.

#Installation

    $ gem install recloner

#Usage

    require 'recloner'
    class MyDocument < CouchRest::Model::Base
      include Recloner
      property :name
    end

    m = MyDocument.create :name => "m"
    p m.id #==> "78439279432743279"
    p m.name #==> "m"
    m1 = m.clone
    p m1.id #==> "45353762637126371"
    p m.name #==> "m"
    m2 = m.clone {|doc| doc.name = "m2"}
    p m2.id #==> "1234566789090"
    p m2.name #==> "m2"

