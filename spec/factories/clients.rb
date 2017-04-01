FactoryGirl.define do
  factory :client do
    name "Gob Bluth"
    email "gob@bluth.com"
    username "gob_bluth"
    password "magicman"
    trainer true
  end

  factory :trainer, class: Client do
    name "George Michael Bluth"
    email "gmbluth@phoenix.edu"
    username "gmbluth"
    password "annfannmann"
    trainer false
  end
end
