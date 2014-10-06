#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use DDG::Test::Goodie;
use Convert::Braille;
use utf8;

zci answer_type => 'braille';
zci is_cached   => 1;

ddg_goodie_test(
    [qw( DDG::Goodie::Braille)],
    'hello in braille' => test_zci(
        "⠓⠑⠇⠇⠕ (Braille)",
        structured_answer => {
            input     => ['hello'],
            operation => 'Braille translation',
            result    => '⠓⠑⠇⠇⠕'
        }
    ),
    '⠓⠑⠇⠇⠕' => test_zci(
        "hello (Braille)",
        structured_answer => {
            input     => ['⠓⠑⠇⠇⠕'],
            operation => 'Braille translation',
            result    => 'hello'
        }
    ),
    'translate to braille translate to braille' => test_zci(
        "⠞⠗⠁⠝⠎⠇⠁⠞⠑⠀⠞⠕⠀⠃⠗⠁⠊⠇⠇⠑ (Braille)",
        structured_answer => {
            input     => ['translate to braille'],
            operation => 'Braille translation',
            result    => '⠞⠗⠁⠝⠎⠇⠁⠞⠑⠀⠞⠕⠀⠃⠗⠁⠊⠇⠇⠑'
        }
    ),
    '⠞⠗⠁⠝⠎⠇⠁⠞⠑⠀⠞⠕⠀⠃⠗⠁⠊⠇⠇⠑' => test_zci(
        "translate to braille (Braille)",
        structured_answer => {
            input     => ['⠞⠗⠁⠝⠎⠇⠁⠞⠑⠀⠞⠕⠀⠃⠗⠁⠊⠇⠇⠑'],
            operation => 'Braille translation',
            result    => 'translate to braille'
          }

    ),
    'braille asdf k' => test_zci(
        "⠁⠎⠙⠋⠀⠅ (Braille)",
        structured_answer => {
            input     => ['asdf k'],
            operation => 'Braille translation',
            result    => '⠁⠎⠙⠋⠀⠅'
          }

    ),
    '⠁⠎⠙⠋⠀⠅' => test_zci(
        "asdf k (Braille)",
        structured_answer => {
            input     => ['⠁⠎⠙⠋⠀⠅'],
            operation => 'Braille translation',
            result    => 'asdf k'
          }

    ),
);

done_testing;
