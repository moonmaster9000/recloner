#Introduction

Exposes a "Recloner" module containing a "clone" method that you can mixin to your CouchRest::Model::Base derived objects.

#Installation

    $ gem install recloner

#Usage

There are two types of clones: soft clones (the `clone` method) and persisted clones (the `clone!` method).

## Soft clones

    require 'recloner'
    class MyDocument < CouchRest::Model::Base
      include Recloner
      property :name
    end

    m = MyDocument.create :name => "m"
    p m.id #==> "78439279432743279"
    p m.name #==> "m"
    m1 = m.clone

    m1.new_record? #==> true
    m1.id #==> nil

As you can see, a soft clone simply creates a copy in-memory - it's up to you to persist it (`save`) to the database.

## Persisted clones

    m = MyDocument.create :name => "m"
    p m.id #==> "78439279432743279"
    p m.name #==> "m"
    m1 = m.clone!
    p m1.id #==> "45353762637126371"
    p m.name #==> "m"


## Modifying your clone

You can pass modifications to the clone (either a soft clone or a persisted clone) in the following manner:

    m = MyDocument.create :name => "m"
    m1 = m.clone do |doc|
      doc.name += " clone"
    end
