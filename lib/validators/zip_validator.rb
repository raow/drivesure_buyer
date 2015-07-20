#encoding: utf-8
# Copyright (GuanGuang) 2013.10.29 Bruce
# Zip validate
class ZipValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A[1-9]\d{5}\Z/
      record.errors[attribute] << (options[:message] || "不是有效邮政编码")
    end
  end
end