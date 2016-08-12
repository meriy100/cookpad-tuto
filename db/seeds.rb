require 'ckpd_intern/seed'

ActiveRecord::Base.transaction do
  CkpdIntern::Seed.create_all!
end
