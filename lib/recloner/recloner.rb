module Recloner
  def clone(&block)
    block ||= Proc.new {}
    next_id = database.server.next_uuid
    copy next_id
    self.class.get(next_id).tap(&block).tap {|d| d.save}
  end
end
