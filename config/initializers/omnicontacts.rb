require "omnicontacts"

Rails.application.middleware.use OmniContacts::Builder do
  importer :gmail, "731500353976.apps.googleusercontent.com", "lVKNz60_RdwHOr3vocEfKb9N", {:redirect_path => "/contacts/gmail/contact_callback"}
importer :yahoo, "dj0yJmk9WEFzREpidHBJM1U5JmQ9WVdrOWR6bEViM0ZrTTJVbWNHbzlPRGswTVRBMU9EWXkmcz1jb25zdW1lcnNlY3JldCZ4PTgw", "c43984c5cac8b07431dc0a4f4ab7f04776bdca7f", {:callback_path => '/contacts/yahoo/contact_callback'}
#importer :yahoo, "dj0yJmk9OVlCbERTdTNONGxEJmQ9WVdrOU4wbE5kVXBHTkc4bWNHbzlOVFF3TmpBMk1EWXkmcz1jb25zdW1lcnNlY3JldCZ4PWZj", "cd47d320b57d86fb3a6dada549e18a3bb3f811ec", {:callback_path => '/invites/yahoo/contact_callback'}
  importer :hotmail, "00000000480EB040", "aR4DLqb7IlX76I0xF3YLA8O-rjoGy67o", {:callback_path => 'http://localcontacts.com/contacts/hotmail/contact_callback'}
end