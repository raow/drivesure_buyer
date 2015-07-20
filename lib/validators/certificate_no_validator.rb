#encoding: utf-8
# Copyright (GuanGuang) 2013.10.29 Bruce
# ID validate
class CertificateNoValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A\d{15}(\d\d[0-9xX])?\Z/
      record.errors[attribute] << (options[:message] || "不是有效身份证")
    end
  end
end
