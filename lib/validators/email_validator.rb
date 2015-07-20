#encoding: utf-8
# Copyright (GuanGuang) 2013.10.29 Bruce
# Email validate
class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "不是有效邮箱")
    end
  end
end
