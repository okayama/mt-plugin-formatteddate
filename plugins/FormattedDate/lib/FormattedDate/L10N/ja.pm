package FormattedDate::L10N::ja;
use strict;
use base 'FormattedDate::L10N';
use vars qw( %Lexicon );

our %Lexicon = (
    '_PLUGIN_DESCRIPTION' => &_plugin_description,
);

sub _plugin_description {
    return<<'TEXT';
<p>
    ファンクションタグ MTFormattedDate が、文字列やテンプレートタグの出力結果をモディファイア format で指定した形式で出力します。以下の形式でテンプレートタグを記述します(ダイナミックパブリッシングに対応しています)。
</p>
<ul>
    <li>&lt;$MTFormattedDate tag="EntryTitle" format="%Y年%m月%d日"$&gt;</li>
    <li>&lt;$MTFormattedDate name="entry_title" format="%Y年%m月%d日"$&gt;</li>
    <li>&lt;$MTFormattedDate var="entry_title" format="%Y年%m月%d日"$&gt;</li>
</ul>
TEXT
}

1;
