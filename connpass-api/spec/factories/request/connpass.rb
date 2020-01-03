FactoryBot.define do
  factory :request_connpass, class: Request::Connpass do
    keyword { 'python' }
    factory :request_connpass_count_over do
      count { 101 }
    end
  end
end
