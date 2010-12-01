package FormattedDate::L10N::en_us;
use strict;
use base 'FormattedDate::L10N';
use vars qw( %Lexicon );

our %Lexicon = (
    '_PLUGIN_DESCRIPTION' => &_plugin_description,
);

sub _plugin_description {
    return<<'TEXT';
<p>
    Function tag 'MTFormattedDate' output formatted date by 'format' modifier from strings or template tags.
    Following is example(this works also in dynamic publishing)。
</p>
<ul>
    <li>&lt;$MTFormattedDate tag="EntryTitle" format="%Y年%m月%d日"$&gt;</li>
    <li>&lt;$MTFormattedDate name="entry_title" format="%Y年%m月%d日"$&gt;</li>
    <li>&lt;$MTFormattedDate var="entry_title" format="%Y年%m月%d日"$&gt;</li>
</ul>
TEXT
}

1;
