<?php


use Silex\Application as BaseApplication;

class Application extends BaseApplication
{
    use BaseApplication\TwigTrait;
    use BaseApplication\SecurityTrait;
    use BaseApplication\FormTrait;
    use BaseApplication\UrlGeneratorTrait;
    use BaseApplication\SwiftmailerTrait;
    use BaseApplication\MonologTrait;
    use BaseApplication\TranslationTrait;
}



return new BaseApplication;
