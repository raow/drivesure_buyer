#encoding: utf-8
# Copyright (GuanGuang) 2013.10.29 Bruce
# mobile validate
class MobileValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A1[3|4|5|8][0-9]\d{8}\Z/
      record.errors[attribute] << (options[:message] || "不是有效电话")
    end
  end
end
