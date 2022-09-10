<?php
/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */

/* @var $model app\models\LoginForm */

use app\bundles\TemplateAsset;
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

$this->title = 'Iniciar sesión';
$this->params['breadcrumbs'][] = $this->title;

$bundle = TemplateAsset::register($this);
?>

<!--begin::Login-->
<div class="login login-4 login-signin-on d-flex flex-row-fluid" id="kt_login">
    <div class="d-flex flex-center flex-row-fluid bgi-size-cover bgi-position-top bgi-no-repeat"
         style="background-image: url('<?php echo $bundle->baseUrl ?>/media/bg/bg-3.jpg');">
        <div class="login-form text-center p-7 position-relative overflow-hidden">
            <!--begin::Login Header-->
            <div class="d-flex flex-center mb-10">
                <a href="#">
                    <img src="<?php echo $bundle->baseUrl ?>/media/logos/logo_mantenimiento.png" class="max-h-90px"
                         alt=""/>
                </a>
            </div>
            <!--end::Login Header-->
            <!--begin::Login Sign in form-->
            <div class="login-signin">
                <div class="mb-10">
                    <h3>Iniciar sesión</h3>
                    <div class="text-muted font-weight-bold">Ingrese sus datos para iniciar sesión en su cuenta
                    </div>
                </div>
                <?php
                $form = ActiveForm::begin([
                    'options' => ['class' => 'p-t-15 ng-pristine ng-valid'],
                    'fieldConfig' => [
                        'template' => "{input}\n{error}",
                    ]
                ]);
                ?>
                <div class="form-group mb-5">
                    <?= $form->field($model, 'usuario')->textInput(['autofocus' => true, 'placeholder' => 'Ingrese usuario o dni', 'class' => 'form-control h-auto form-control-solid py-4 px-8']) ?>
                </div>
                <div class="form-group mb-5">
                    <?= $form->field($model, 'password')->passwordInput(['placeholder' => 'Contraseña', 'class' => 'form-control h-auto form-control-solid py-4 px-8']) ?>
                </div>
                <div class="form-group mb-0 d-flex flex-wrap justify-content-between align-items-center">
                    <div class="checkbox-inline">
                        <?=
                        $form->field($model, 'rememberMe')->checkbox([
                            'template' => "{input}\n{label}\n{error}",
                            'class' => 'mb-0'
                        ])
                        ?>
                    </div>

                </div>
                <?= Html::submitButton('Ingresar', ['class' => 'btn btn-primary font-weight-bold px-9 py-4 my-3 mx-4', 'name' => 'login-button']) ?>
                <?php ActiveForm::end(); ?>

            </div>

        </div>
    </div>
</div>
<!--end::Login-->
