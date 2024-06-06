# Flutter CliSitef

Projeto desenvolvido para auxiliar na integração do SDK CliSitef com o Flutter.

## Flutter Version

```bash
    Flutter 3.7.5 • channel stable • https://github.com/flutter/flutter.git
    Framework • revision c07f788888 (12 months ago) • 2023-02-22 17:52:33 -0600
    Engine • revision 0f359063c4
    Tools • Dart 2.19.2 • DevTools 2.20.1
```

## Configuração

Para utilizar o SDK é necessário incluir as bibliotecas e realizar as seguintes configurações:

Obs:

- As bibliotecas necessárias para a execução do SDK são fornecidas pela empresa desenvolvedora do SDK.

As bibliotecas podem ser diferentes para cada modelo de terminal, por isso é importante verificar com a empresa desenvolvedora do SDK.

Adicione o arquivo de configurações `PPCompXXX-vXXX-XXX-XXX.aar` na pasta `android/app/libs` do seu projeto.

Obs:

- O arquivo `PPCompXXX-vXXX-XXX-XXX.aar` é fornecido pela empresa desenvolvedora do SDK.
- O arquivo `PPCompXXX-vXXX-XXX-XXX.aar` é necessário para a execução do SDK.
- O arquivo `PPCompXXX-vXXX-XXX-XXX.aar` é diferente para cada modelo de terminal, por isso é importante verificar com a empresa desenvolvedora do SDK.

Caso a pasta `libs` não exista, crie-a.

Na pasta `android/src/main` do seu projeto, abra o arquivo `AndroidManifest.xml` e adicione as seguintes permissões:

```xml
    <uses-permission android:name="android.permission.BLUETOOTH" /> <- Permissão para utilizar o bluetooth
    <uses-permission android:name="android.permission.BLUETOOTH_ADMIN" /> <- Permissão para utilizar o bluetooth
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" /> <- Permissão para acessar o estado da rede
    <uses-permission android:name="android.permission.READ_PHONE_STATE" /> <- Permissão para acessar o estado do telefone
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" /> <- Permissão para escrever no armazenamento externo
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" /> <- Permissão para ler o armazenamento externo
```

Na pasta `android/src/main` adicione a pasta `jniLibs` com os arquivos `.so` necessários para a execução do SDK.

Esta pasta contém as bibliotecas nativas necessárias para a execução do SDK.

A estrutura da pasta `jniLibs` é a seguinte:

```bash
    jniLibs
    ├── arm64-v8a
    ├── armeabi
    ├── armeabi-v7a
    ├── mips
    ├── mips64
    ├── x86
    ├── x86_64
```

Na pasta `android/src/main/kotlin/libs` adicione o arquivo `clisitef-android.jar`.

Obs:

- O arquivo `PPCompXXX-vXXX-XXX-XXX.aar` dever ser compatível com a versão do SDK e com os arquivos `.so` incluídos nas pastas `android/src/main/jniLibs` e `android/src/main/kotlin/libs` necessários para a execução do SDK.

No arquivo `android/src/build.gradle` adicione os seguintes código:

```gradle

    .
    .
    .

    rootProject.allprojects {
        repositories {
            google()
            mavenCentral()
            flatDir {
                dirs project(':flutter_clisitef').file('libs') <--- Este é o caminho para a pasta onde está o arquivo .jar
            }
        }
    }

    .
    .
    .

    allprojects {
        repositories {
            google()
            mavenCentral() <- Este é o repositório onde as dependências do projeto estão localizadas
        }
    }

    .
    .
    .

    android {
        compileSdkVersion 31 <--- Versão do SDK

        compileOptions {
            sourceCompatibility JavaVersion.VERSION_1_8
            targetCompatibility JavaVersion.VERSION_1_8
        }

        kotlinOptions {
            jvmTarget = '1.8'
        }

        sourceSets {
            main.java.srcDirs += 'src/main/kotlin'
        }

        defaultConfig {
            minSdkVersion 21
        }

        packagingOptions{
            doNotStrip "**/libclisitef.so" <--- Este é o arquivo .so necessário para a execução do SDK
        }
    }

    .
    .
    .

    dependencies {
        implementation files('src/main/kotlin/libs/clisitef-android.jar') <--- Este é o caminho para o arquivo .jar
        implementation (name: 'PPCompGPOS720-v1.33-Complete-debug', ext: 'aar') <--- Este é o caminho para o arquivo .aar
    }

```
