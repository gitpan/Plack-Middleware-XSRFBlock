
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Block XSRF Attacks with minimal changes to your app",
  "AUTHOR" => "Chisel <chisel\@chizography.net>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Plack-Middleware-XSRFBlock",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Plack::Middleware::XSRFBlock",
  "PREREQ_PM" => {
    "Digest::HMAC_SHA1" => 0,
    "HTML::Parser" => 0,
    "HTTP::Status" => 0,
    "Plack::Middleware" => 0,
    "Plack::Response" => 0,
    "Plack::Util" => 0,
    "Plack::Util::Accessor" => 0,
    "parent" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "Carp" => 0,
    "FindBin::libs" => 0,
    "HTTP::Cookies" => 0,
    "HTTP::Message::PSGI" => 0,
    "HTTP::Request" => 0,
    "HTTP::Request::Common" => 0,
    "HTTP::Response" => 0,
    "LWP::UserAgent" => 0,
    "Log::Dispatch" => 0,
    "Plack::Builder" => 0,
    "Plack::Session::State::Cookie" => 0,
    "Plack::Test" => 0,
    "Sub::Exporter" => 0,
    "Test::More" => 0,
    "Test::UseAllModules" => 0,
    "Try::Tiny" => 0
  },
  "VERSION" => "0.0.0_04",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



