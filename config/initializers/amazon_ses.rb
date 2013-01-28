#
# encoding: utf-8
ActionMailer::Base.add_delivery_method :ses, AWS::SES::Base,
  :access_key_id     => 'AKIAIXBIF6NFJAW6KPVQ',
  :secret_access_key => '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'
